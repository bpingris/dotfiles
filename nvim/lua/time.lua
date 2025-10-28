-- ASCII art numbers for clock display
local ASCII_NUMBERS = {
	["0"] = {
		" ### ",
		"#   #",
		"#   #",
		"#   #",
		"#   #",
		"#   #",
		" ### ",
	},
	["1"] = {
		"  #  ",
		" ##  ",
		"# #  ",
		"  #  ",
		"  #  ",
		"  #  ",
		"#####",
	},
	["2"] = {
		" ### ",
		"#   #",
		"    #",
		"   # ",
		"  #  ",
		" #   ",
		"#####",
	},
	["3"] = {
		" ### ",
		"#   #",
		"    #",
		" ### ",
		"    #",
		"#   #",
		" ### ",
	},
	["4"] = {
		"#   #",
		"#   #",
		"#   #",
		"#####",
		"    #",
		"    #",
		"    #",
	},
	["5"] = {
		"#####",
		"#    ",
		"#    ",
		"#### ",
		"    #",
		"#   #",
		" ### ",
	},
	["6"] = {
		" ### ",
		"#    ",
		"#    ",
		"#### ",
		"#   #",
		"#   #",
		" ### ",
	},
	["7"] = {
		"#####",
		"    #",
		"   # ",
		"  #  ",
		" #   ",
		"#    ",
		"#    ",
	},
	["8"] = {
		" ### ",
		"#   #",
		"#   #",
		" ### ",
		"#   #",
		"#   #",
		" ### ",
	},
	["9"] = {
		" ### ",
		"#   #",
		"#   #",
		" ####",
		"    #",
		"    #",
		" ### ",
	},
	[":"] = {
		"     ",
		"  #  ",
		"     ",
		"     ",
		"  #  ",
		"     ",
		"     ",
	},
}

-- Pretty print current time with ASCII art
local function print_current_time()
	local current_time = os.date("*t")
	local time_str = string.format("%02d:%02d:%02d", current_time.hour, current_time.min, current_time.sec)

	-- Create ASCII clock
	print(
		"╔═════════════════════════════════════════════════╗"
	)
	print("║                   ASCII CLOCK                   ║")
	print(
		"╠═════════════════════════════════════════════════╣"
	)

	-- Print each line of the ASCII art
	for line = 1, 7 do
		local clock_line = "║ "
		for char in time_str:gmatch(".") do
			local number_art = ASCII_NUMBERS[char]
			if number_art then
				clock_line = clock_line .. number_art[line] .. " "
			else
				clock_line = clock_line .. "     "
			end
		end
		clock_line = clock_line .. "║"
		print(clock_line)
	end

	print(
		"╠═════════════════════════════════════════════════╣"
	)
	print(
		"║   "
			.. string.format(
				"%s, %s %d, %d",
				current_time.wday == 1 and "Sunday"
					or current_time.wday == 2 and "Monday"
					or current_time.wday == 3 and "Tuesday"
					or current_time.wday == 4 and "Wednesday"
					or current_time.wday == 5 and "Thursday"
					or current_time.wday == 6 and "Friday"
					or "Saturday",
				current_time.month == 1 and "January"
					or current_time.month == 2 and "February"
					or current_time.month == 3 and "March"
					or current_time.month == 4 and "April"
					or current_time.month == 5 and "May"
					or current_time.month == 6 and "June"
					or current_time.month == 7 and "July"
					or current_time.month == 8 and "August"
					or current_time.month == 9 and "September"
					or current_time.month == 10 and "October"
					or current_time.month == 11 and "November"
					or "December",
				current_time.day,
				current_time.year
			)
			.. string.rep(
				" ",
				37
					- string
						.format(
							"%s, %s %d, %d",
							current_time.wday == 1 and "Sunday"
								or current_time.wday == 2 and "Monday"
								or current_time.wday == 3 and "Tuesday"
								or current_time.wday == 4 and "Wednesday"
								or current_time.wday == 5 and "Thursday"
								or current_time.wday == 6 and "Friday"
								or "Saturday",
							current_time.month == 1 and "January"
								or current_time.month == 2 and "February"
								or current_time.month == 3 and "March"
								or current_time.month == 4 and "April"
								or current_time.month == 5 and "May"
								or current_time.month == 6 and "June"
								or current_time.month == 7 and "July"
								or current_time.month == 8 and "August"
								or current_time.month == 9 and "September"
								or current_time.month == 10 and "October"
								or current_time.month == 11 and "November"
								or "December",
							current_time.day,
							current_time.year
						)
						:len()
			)
			.. "         ║"
	)
	print(
		"╚═════════════════════════════════════════════════╝"
	)
end

-- Print time when file is loaded
print_current_time()

-- Return the function so it can be called externally
return {
	print_time = print_current_time,
}

