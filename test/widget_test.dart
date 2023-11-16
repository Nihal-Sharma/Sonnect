class _MyHomePageState extends State<MyHomePage> {
  final FirebaseStorage storage = FirebaseStorage(
      app: Firestore.instance.app,
      storageBucket: 'gs://my-project.appspot.com');

  Uint8List imageBytes;
  String errorMsg;

  _MyHomePageState() {
    storage
        .ref()
        .child('selfies/me2.jpg')
        .getData(10000000)
        .then((data) => setState(() {
              imageBytes = data;
            }))
        .catchError((e) => setState(() {
              errorMsg = e.error;
            }));
  }

  @override
  Widget build(BuildContext context) {
    var img = imageBytes != null
        ? Image.memory(
            imageBytes,
            fit: BoxFit.cover,
          )
        : Text(errorMsg != null ? errorMsg : "Loading...");

    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: new ListView(
          children: <Widget>[
            img,
          ],
        ));
  }
}
