local curl = require("plenary.curl")
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local previewers = require("telescope.previewers")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local entry_display = require("telescope.pickers.entry_display")
local Job = require("plenary.job")

local LINEAR_API_KEY = "use $LINEAR_KEY or something"

local ISSUE_FRAGMENT =
	[[ id identifier title branchName priority priorityLabel estimate updatedAt url number labels { nodes { id name color } } state { id type name color } assignee { id displayName email avatarUrl } team { id issueEstimationType issueEstimationAllowZero issueEstimationExtended activeCycle { id } } cycle { id number startsAt endsAt completedAt } parent { id title number state { type color } } project { id name icon color }]]

local function assigned_issues(opts)
	local query = [[ { "query": "{ viewer { assignedIssues(orderBy: updatedAt) { nodes { ]]
		.. ISSUE_FRAGMENT
		.. [[ } } } }" }]]
	local issues = curl.post("https://api.linear.app/graphql", {
		body = query,
		headers = {
			content_type = "application/json",
			Authorization = LINEAR_API_KEY,
		},
	})
	if not issues then
		return
	end
	local nodes = vim.json.decode(issues.body).data.viewer.assignedIssues.nodes

	local titles = vim.tbl_map(function(n)
		return {
			title = n.title,
			assignee = n.assignee.displayName,
			git_branch = n.branchName,
			priority = n.priorityLabel,
			estimate = n.estimate,
		}
	end, nodes)

	local displayer = entry_display.create({
		separator = " ",
		items = {
			{ width = 10 },
			{ width = 100 },
			{ remaining = true },
		},
	})

	local function make_display(entry)
		return displayer({
			entry.value.priority,
			{ entry.value.title, "TelescopeResultsIdentifier" },
			entry.value.assignee,
		})
	end

	local function make_preview(entry)
		Job:new({
			command = "",
		})
	end

	opts = opts or {}
	pickers
		.new(opts, {
			prompt_title = "linear",
			finder = finders.new_table({
				results = titles,
				entry_maker = function(entry)
					return {
						ordinal = entry.title,
						display = make_display,
						value = entry,
					}
				end,
			}),
			sorter = conf.generic_sorter(opts),
			attach_mappings = function(prompt_bufnr)
				actions.select_default:replace(function()
					actions.close(prompt_bufnr)
					local selection = action_state.get_selected_entry()
					vim.fn.setreg("*", selection.value.git_branch)
				end)
				return true
			end,
		})
		:find()
end

assigned_issues()
