The Data Stones Production Pipeline


2020

Peter Nelson
Alexis Mailles



1. Download Corpus


Email

Using Mozilla Thunderbird, download all emails sent between two parties

Signal

1. Make Signal Backup from app

2. Decrypt Signal Backup
- need to use "signal-back_windows_amd64.exe" from GitHub in order to decrypt
- also need codes sent from Signal
- DOS Command: signal-back_windows_amd64.exe format -f CSV -o backup.csv signal-2020-01-23-15-46-30.backup
--> need to change name of "signal-2020-etc etc" to correct file

3. Use Excel to clean .csv into signalAll.txt
- select address_device_ID, date_send, body columns
- Copy contents into a new file
- export text file

4. Process signalAll.txt using signalExtract.pde

WhatsApp

Backup conversation to .txt file in the app. Download .txt file.


Facebook

Backup entire Facebook personal data
Find the .html file relevant to the conversation parties

2. Process Corpus into Curves

The script Collective Curve uses the post.txt files made in EmailCurvePost, SignalCurvePost, WhatsAppCurvePost and FacebookCurvePost. Each post.txt file gives the X, Y, Z co-ordinates for the email curve which will be made in Collective Curve. Z is absolute time, where as time increases, each message moves up on the Z axis. Y and X are moved by the length of the message sent by each person. Eg. P sends a message of 200 characters, X moves 200, then B sends a message of 80 characters, so Y moves 80 characters. This produces a gestural line of conversation.

EmailCurvePost currently requires two folders of processed text which are exported from the EmailCurve script, which inputs the Thunderbird emails and outputs numbered text files.
3. Process corpus into displacement bitmaps for fine rock texture

Inside the CurveGenerators folder each corpus should also have two DisplacementGenerators, one for medium depth textures and one for fine textures. The medium depth textures is a greyscale bitmap where the length of one message from P is a single greyscale value and the length of one message from B is another greyscale value. These values stay constant and are output into a square image of grey stripes. The fine detail bitmap has the same format, but individual letters are given greyscale values such that technically the entire bitmap image could be decoded back into text. 

4. Generate polygon stone in Blender

1. Import curves
- scale all .01
- scale Z .01

Signal time period:
24/10/2018 - 1/11/2019

FB time period:
- 25/09/2015 - 22/06/2019

WhatsApp time period:
8/08/2017 - 28/06/2019

Email time period:
- 26/01/2016 - 7/02/2020

* NOTE: Emails are naturally longer than instant messages. So it might be a nice idea to scale them differently on the non-time axis
* Scale them so they are a reasonable real world scale to make rendering easier.

3.  Convert curve to mesh
5. Extrude mesh line down on Z axis
- by a distance that looks good between the detail of the mesh and the geomorphology
- do a whole lot of edge extrudes to fill all the gaps in the mesh

8.  Displacements
- voxel remesh to get some basic rounding 9polygons not too much smaller than the height or original faces, so it doesn’tt get too geometrical)
- small detail and large detail displacements
- for large displacements, blur and contrast in GIMP
- use negative displacement for large displacements
- need to rotate mesh to match the displacement (rotate mesh and apply rotation, then rotate it back)
- Play with the natural scale of the mesh relative t othe displacements until it looks good
- apply displacements, merge object, voxel remesh, boolean flatten the base, export


9. Should I correct the height of each message corpus rock on the z axis to absolute time?
10. once displacements applied, combine meshes and remesh. something like 0.05 voxel size




