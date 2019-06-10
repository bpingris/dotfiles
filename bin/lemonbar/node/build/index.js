var __awaiter =
  (this && this.__awaiter) ||
  function(thisArg, _arguments, P, generator) {
    return new (P || (P = Promise))(function(resolve, reject) {
      function fulfilled(value) {
        try {
          step(generator.next(value));
        } catch (e) {
          reject(e);
        }
      }
      function rejected(value) {
        try {
          step(generator["throw"](value));
        } catch (e) {
          reject(e);
        }
      }
      function step(result) {
        result.done
          ? resolve(result.value)
          : new P(function(resolve) {
              resolve(result.value);
            }).then(fulfilled, rejected);
      }
      step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
  };
Object.defineProperty(exports, "__esModule", { value: true });
const { exec } = require("child_process");
const log = console.log;
const I3_WORKSPACES = "i3-msg -t get_workspaces";
exec(I3_WORKSPACES, (err, stdout, stderr) => {
  const workspaces = JSON.parse(stdout);
  render(workspaces);
});
const sleep = milliseconds => {
  return new Promise(resolve => setTimeout(resolve, milliseconds));
};
const NC = "\033[0m";
const RED = "\033[0;31m";
const YELLOW = "\033[0;33m";
const render = workspaces =>
  __awaiter(this, void 0, void 0, function*() {
    while (true) {
      let buff = "";
      let color = "";
      workspaces.forEach(ws => {
        color = RED;
        if (ws.focused) {
          color = YELLOW;
        }
        buff = `${buff} ${color}${ws.name}${NC}`;
      });
      log(buff.trim());
      yield sleep(250);
    }
  });
