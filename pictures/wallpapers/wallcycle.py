import os
import time

user = "ferriit"
wallpaperpath = f"/home/{user}/Pictures/wallpapers/"

i = 0
while True:
    backgrounds = os.listdir(wallpaperpath)
    while not backgrounds[i % len(backgrounds)].endswith((".png", ".jpg", ".jpeg", ".avif")):
        i += 1
    os.system(f"feh --bg-fill \"{wallpaperpath}{backgrounds[i % len(backgrounds)]}\"")
    i += 1
    time.sleep(5 * 60)
