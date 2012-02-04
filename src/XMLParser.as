import mx.rpc.events.FaultEvent;
import mx.rpc.events.ResultEvent;
import mx.rpc.xml.SimpleXMLDecoder;

private function serv_result(evt:ResultEvent):void {
	/* Convert XMLNode to XMLDocument. */
	var xmlStr:String = evt.result.toString();
	var xmlDoc:XMLDocument = new XMLDocument(xmlStr);
	var decoder:SimpleXMLDecoder = new SimpleXMLDecoder(true);
	var resultObj:Object = decoder.decodeXML(xmlDoc);
	/* Assign the values... */
	nameText.text = resultObj.album.name;
	img0Text.text = resultObj.album.images.image[0];
	img1Text.text = resultObj.album.images.image[1];
	img2Text.text = resultObj.album.images.image[2];
}

private function serv_fault(evt:FaultEvent):void {
	// Show the error label.
	error.text += evt.fault.faultString;
	error.visible = true;
	// Hide the form.
	form.visible = false;
}