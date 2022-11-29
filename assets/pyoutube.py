from pytube import YouTube
video = YouTube('https://www.youtube.com/watch?v=kOdBxKPaz5Y')
stream = video.streams.get_highest_resolution()
stream.download(output_path='C:/Users/Y.MRABTI/Music')
