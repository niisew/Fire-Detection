import numpy as np
from PIL import Image
import matplotlib.pyplot as plt
import random
import dionysus as d
from gudhi.wasserstein import wasserstein_distance as wd
from sklearn.cluster import KMeans
from numpy import linalg as LA


def image_to_point_clouds(image_path, noise_level, n_samples, n_clouds):
    # Load the image
    image = Image.open(image_path)

    # Convert the image to black and white
    bw_image = image.convert('L').point(lambda x: 0 if x < 128 else 255, '1')

    # Extract coordinates of black pixels
    black_pixels = np.column_stack(np.where(np.array(bw_image) == 0))

    # Adjust the number of points to n_samples
    if len(black_pixels) > n_samples:
        selected_indices = np.random.choice(len(black_pixels), n_samples, replace=False)
        black_pixels = black_pixels[selected_indices]
    elif len(black_pixels) < n_samples:
        selected_indices = np.random.choice(len(black_pixels), n_samples, replace=True)
        black_pixels = black_pixels[selected_indices]

    point_clouds = []
    for _ in range(n_clouds):
        # Add noise
        noisy_points = black_pixels + noise_level * np.random.normal(size=black_pixels.shape)
        point_clouds.append(noisy_points)

    return point_clouds

def plot_Dionysus_PDs(pd0_array, pd1_array, titles, lower_bound=240, upper_bound=300):
    fig = plt.figure(figsize=(30,18))
    nday = len(pd0_array)
    for iday in np.arange(nday):
        ax = fig.add_subplot(2,7,1+iday)
        ax.scatter(pd0_array[iday][0], pd0_array[iday][1], color='r', s=5, label = '0')
        ax.scatter(pd1_array[iday][0], pd1_array[iday][1], marker='^', s=5, facecolors='none', edgecolor='blue', label = '1')

        ax.plot(np.arange(0, 3), np.arange(0, 3), '-', color='grey', lw=0.5)
        #ax.set_xlim([lower_bound, upper_bound])
        #ax.set_ylim([lower_bound, upper_bound])
        ax.set_title(titles[iday])
        ax.set_xlabel('Birth')
        ax.set_ylabel('Death')
    plt.savefig("pds.pdf",bbox_inches='tight')
    plt.show()

def getPD(data, r):
    f = d.fill_rips(np.array(data, dtype='float64'), 2, r)
    p = d.homology_persistence(f)
    dgms = d.init_diagrams(p, f)
    birth0 = [dgm.birth for dgm in dgms[0]]
    death0 = [dgm.death for dgm in dgms[0]]
    birth1 = [dgm.birth for dgm in dgms[1]]
    death1 = [dgm.death for dgm in dgms[1]]
    return [[birth0,death0],[birth1,death1]]

def coordinates_to_image(x_coords, y_coords, image_size=(100, 100)):
    # Create an array of zeros with the specified image size
    image = np.zeros(image_size, dtype=int)

    # Normalize the coordinates to fit within the image size
    x_coords = ((x_coords - np.min(x_coords)) / (np.max(x_coords) - np.min(x_coords))) * (image_size[0] - 1)
    y_coords = ((y_coords - np.min(y_coords)) / (np.max(y_coords) - np.min(y_coords))) * (image_size[1] - 1)

    # Round the coordinates to the nearest integer and set corresponding pixels to 1
    x_coords = np.round(x_coords).astype(int)
    y_coords = np.round(y_coords).astype(int)
    image[y_coords, x_coords] = 1

    return image
print("Imported Successfully")