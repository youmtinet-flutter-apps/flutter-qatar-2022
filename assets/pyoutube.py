from pytube import YouTube

# run 
# python pyoutube.py

video = YouTube('https://youtu.be/n0aVywcBk3c')
stream = video.streams.get_highest_resolution()
stream.download(output_path='C:/Users/Y.MRABTI/videos')
