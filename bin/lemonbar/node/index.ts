const { exec } = require("child_process");

import { Workspace } from "./interfaces";

const log = console.log;

const I3_WORKSPACES: string = "i3-msg -t get_workspaces";

exec(I3_WORKSPACES, (err: Error, stdout: string, stderr: string) => {
  const workspaces: Workspace[] = <Workspace[]>JSON.parse(stdout);

  render(workspaces);
});

const sleep = (milliseconds: number) => {
  return new Promise(resolve => setTimeout(resolve, milliseconds));
};

const NC: string = "\033[0m";
const RED: string = "\033[0;31m";
const YELLOW: string = "\033[0;33m";

const render = async (workspaces: Workspace[]) => {
  while (true) {
    let buff: string = "";
    let color: string = "";
    workspaces.forEach(ws => {
      color = RED;
      if (ws.focused) {
        color = YELLOW;
      }
      buff = `${buff} ${color}${ws.name}${NC}`;
    });
    log(buff.trim());
    await sleep(250);
  }
};
