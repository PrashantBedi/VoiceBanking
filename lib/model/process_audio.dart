class ProcessAudio {
  final String input;
  final String output;
  final String action;

  const ProcessAudio({this.input="", this.output="", this.action=""});

  bool isEmpty() {
    return this.input == "" && this.action == "" && this.output == "";
  }
}