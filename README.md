# Deploy TensorFlow Object Detection Models to IoT Edge

This example contains the code and configuration files to deploy a Tensorflow model to IoT Edge in order to do object detection on a live camera feed. Therefore, the inferencing is happening close to the edge device rather than video frames being sent to the cloud for inferencing.

__The IoT Edge device that this solution is deployed to must be an AMD/Intel Chipset__. IoT Python modules are not currently supported on ARM devices.

The python directory contains the following:

* main.py - This is contains the inferencing and connection to IoT hub.
* frozen_inference_graph.pb - This is the frozen graph from the ssd_mobilenet_v1_coco object detection model (you can get more details and download other models by visting the GitHib Tensorflow/model repo - [here](https://github.com/tensorflow/models/blob/master/research/object_detection/g3doc/detection_model_zoo.md)). In this case, the model has been trained on the [COCO dataset](http://mscoco.org/), which contains 90 everyday objects.
* labels.json - This is a json file containing the label classes e.g. person, bottle, cell phone, etc.
* requirements.txt - Contains the python package dependencies. This is used by the dockerfile (see below). 
* deployment.template.json - This is the IoT deployment manifest. Note that we have granted the docker image access to the host hardware in `createOptions` - this allows your IoT module to access the camera attached.
* Dockerfile - Creates the module (docker image) to deploy to IoT edge device.



