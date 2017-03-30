# Codeless Tools
Add components to your proyect without write any code:

<li>Video from URL</li>
<li>Video from local path</li>
<li>Image from URL</li>
<li>WebView from URL</li>
<li>MapView from Latitude and Longitude</li>
<li>Customizable ImageView</li>
<li>More components soon...</li>

<h3>Installation</h3>
1- Add "Tools" folder to your proyect.<br>
2- Follow the instructions below, to add each element.

<h2>*IMPORTANT: You've got to use "https" protocol. To use "http" links, add the field below to "info.plist" file:</h2>

![Alt text](ReadmeImages/Screen0.png?raw=true "Info.plist")

<br><h2>Video from URL</h2>
1- Drag and drop a ImageView to your Storyboard.<br>
2- Asign VideoFromURL.swift as ImageView class in "Identity inspector" tab.<br>
3- Set Url, and video settings in "Attributes Inspector" tab.<br>
4- In the same tab, you optionally can add a image as Thumb. In "Image View" section.<br>
5- Build!<br><br>

![Alt text](ReadmeImages/Screen1.png?raw=true "Video URL")


<br><h2>Video from local</h2>
1- Drag and drop a ImageView to your Storyboard.<br>
2- Asign VideoFromLocal.swift as ImageView class in "Identity inspector" tab.<br>
3- Set Video's name, extension and settings in "Attributes Inspector" tab.<br>
4- In the same tab, you optionally can add a image as Thumb. In "Image View" section.<br>
5- Select your <strong>Project root > your Target > Build Phases > Copy Bundle Resources</strong>. If your video is not listed in this list you should add it using the plus button.
6- Build!<br><br>

![Alt text](ReadmeImages/Screen2.png?raw=true "Video Local")


##Image from URL
1- Drag and drop a ImageView to your Storyboard.<br>
2- Asign ImageFromURL.swift as ImageView class in "Identity inspector" tab.<br>
3- Set Url in "Attributes Inspector" tab.<br>
4- Build!<br><br>

![Alt text](ReadmeImages/Screen3.png?raw=true "Image URL")


##WebView from URL
1- Drag and drop a WebView to your Storyboard.<br>
2- Asign WebViewFromURL.swift as UIWebView class in "Identity inspector" tab.<br>
3- Set Url in "Attributes Inspector" tab.<br>
4- Build!<br><br>

![Alt text](ReadmeImages/Screen4.png?raw=true "WebView URL")


##MapView from Latitude and Longitude
1- Drag and drop a MapView to your Storyboard.<br>
2- Asign MapViewFromLatLong.swift as MKMapView class in "Identity inspector" tab.<br>
3- Set Latitude, longitude and the radius of the region in Km, in "Attributes Inspector" tab.<br>
4- Build!<br><br>


![Alt text](ReadmeImages/Screen5.png?raw=true "MapView Lat Long")


##Customizable ImageView
1- Drag and drop a ImageView to your Storyboard.<br>
2- Asign CustomizableImage.swift as ImageView class in "Identity inspector" tab.<br>
3- Configure the ImageView, in "Attributes Inspector" tab.<br>
4- Build!<br><br>

![Alt text](ReadmeImages/Screen6.png?raw=true "Customizable ImageView")
