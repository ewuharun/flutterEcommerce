import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/constant/ThemeColor.dart';

import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rating_bar/rating_bar.dart';

class CustomerFeedback extends StatefulWidget {
  @override
  _CustomerFeedbackState createState() => _CustomerFeedbackState();
}

class _CustomerFeedbackState extends State<CustomerFeedback>{

  double _ratingSmile = 0;
  String _path = null;
  void _showPhotoLibrary() async {
    final file = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _path = file.path;
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.01),
        elevation: 0,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back,color: blue,),
        ),

        title: Text("Share Your feedback ",style: TextStyle(color: darkBlue,fontFamily: rubikFont),),
        titleSpacing: 0,
        actions: <Widget>[
        ],

      ),
      bottomNavigationBar:Container(
        //color: blue,
        width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.all(20),
        height: 40,
        child:Align(
          alignment: Alignment.center,
          child: Text("Submit",textAlign: TextAlign.center,style: TextStyle(
              color: Colors.white,fontSize: 18
          ),
          ),
        ) ,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "How was your order ? ",style: TextStyle(
                  fontSize: 16,color: Colors.black.withOpacity(0.5)
              ),
              ),
            ),
            Text(
              'Rating : $_ratingSmile',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(height: 8),

            RatingBar(
              onRatingChanged: (rating) => setState(() => _ratingSmile = rating),
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              halfFilledIcon: Icons.star_half,
              isHalfAllowed: true,
              filledColor: darkBlue,
              emptyColor: calenderSelectDateColor,
              halfFilledColor: yellow,
              size: 48,
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                height: 110,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: Colors.grey,
                      width: 1
                  ),
                ),
                child: TextFormField(
                  cursorColor: darkBlue,
                  decoration: InputDecoration(
                    hintText: "Comments if any  ",
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                      child: _path == null ? Image.asset("assets/images/photo.png",width:50 ,height: 50,
                        /*fit:  BoxFit.fill,*/) :
                      Image.file(File(_path),width: MediaQuery.of(context).size.width,height:MediaQuery.of(context).size.height,fit: BoxFit.fill ,),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      child: Text("Take Picture", style: TextStyle(color: Colors.white)),
                      color: yellow,
                      onPressed: () {
                        _showOptions(context);
                      },
                    )
                  ]
              ),
            ),
          ],
        ),
      )
    );
  }
  void _showOptions(BuildContext context) {

    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              height: 150,
              child: Column(children: <Widget>[
                ListTile(
                  onTap: () {
                    // close the modal
                    Navigator.of(context).pop();
                    // show the camera
                    _showCamera(context);
                  },
                  leading: Icon(Icons.photo_camera),
                  title: Text("Take a picture"),
                ),
                ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      _showPhotoLibrary();
                    },
                    leading: Icon(Icons.photo_library),
                    title: Text("Choose from photo library")
                ),
              ])
          );
        }
    );
  }

  void _showCamera( BuildContext context) async {

    final cameras = await availableCameras();
    final camera = cameras.first;

    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => TakePicturePage(camera: camera)));

    setState(() {
      _path = result;
    });
  }
}
class TakePicturePage extends StatefulWidget {
  final CameraDescription camera;
  TakePicturePage({@required this.camera});

  @override
  _TakePicturePageState createState() => _TakePicturePageState();
}
class _TakePicturePageState extends State<TakePicturePage> {
  CameraController _cameraController;
  Future<void> _initializeCameraControllerFuture;

  @override
  void initState() {
    super.initState();

    _cameraController =
        CameraController(widget.camera, ResolutionPreset.medium);

    _initializeCameraControllerFuture = _cameraController.initialize();
  }
  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(children: <Widget>[
      FutureBuilder(
        future: _initializeCameraControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_cameraController);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.all(40),
        child: FloatingActionButton(
          backgroundColor: darkBlue,
          child: Icon(Icons.camera,color:Colors.white,),
          onPressed: (){
            _takePicture(context);
          },

        ),
      )
    ]
    );
  }

  void _takePicture(BuildContext context) async {
    try {
      await _initializeCameraControllerFuture;

      final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');

      await _cameraController.takePicture(path);
      print("image"+path);

      Navigator.pop(context, path);
    } catch (e) {
      print(e);
    }
  }
}
