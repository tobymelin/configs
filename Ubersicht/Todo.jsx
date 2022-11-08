// this is the shell command that gets executed every time this widget refreshes
const todofile = "~/org/inbox.org"
export const command = `grep \"* TODO\" ${todofile} | head -n 1 | sed 's/\* TODO //'`;

// the refresh frequency in milliseconds
export const refreshFrequency = 10000;

// the CSS style for this widget, written using Emotion
// https://emotion.sh/
export const className =`
  bottom: 10px;
  left: 10px;
  // width: 400px;
  box-sizing: border-box;
  margin: auto;
  padding: 0 20px;
  // background-color: rgba(255, 255, 255, 0.2);
  color: #ddd;
  font-family: Helvetica Neue;
  font-weight: 300;
`

// render gets called after the shell command has executed. The command's output
// is passed in as a string.
export const render = ({output}) => {
  return (
    <div>
      <p><strong>TODO</strong>&nbsp;&nbsp;&nbsp;{output}</p>
    </div>
  );
}
