from pytube import YouTube

# run 
# python assets/pyoutube.py

video = YouTube('https://youtu.be/v_NPkSJxbTM')
stream = video.streams.get_highest_resolution()
stream.download(output_path='C:/Users/Y.MRABTI/videos')
