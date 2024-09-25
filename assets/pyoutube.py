from video2audio import AVFile

# run
# python assets/pyoutube.py

# video = YouTube('https://www.youtube.com/watch?v=WEL9Tmh_QXw')
# stream = video.streams.get_audio_only()
# stream.download(output_path='C:/Users/hpr/videos')
f = AVFile("videosplash.mp4")

# Extract the entire audio track as a single mp3:
f.extract_audio("mahdaoui.mp3", chapter=None)

# # Extract the second, entire audio track as a single mp3:
# f.extract_audio('/path/to/some/audio_only_second_stream.mp3', chapter=None, stream=1)

# # Extract each chapter to a separate mp3 file:
# f.extract_all_chapters_audio('/path/to/chapter/outputs/')

# # Extract each chapter to a separate mp3 file, manually naming them:
# f.extract_all_chapters_audio(
#     '/path/to/chapter/outputs/',
#     output_filenames=['ch1_title.mp3', 'ch2_title.mp3', 'ch3_title.mp3']
# )

# # Extract only chapter number 12 (or 13, using 1-indexing):
# chapter_list = f.get_chapters()
# f.extract_audio('single_chapter.mp3', chapter=chapter_list[12])
