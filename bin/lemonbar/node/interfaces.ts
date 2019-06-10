export interface Rect {
  x: number;
  y: number;
  width: number;
  height: number;
}

export interface Workspace {
  num: number;
  name: string;
  visible: boolean;
  focused: boolean;
  rect: Rect;
  output: string;
  urgent: boolean;
}
