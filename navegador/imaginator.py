from PIL import Image

WIDTH, HEIGHT = 1024, 512
FILENAME = ("teste_pillow.png", "PNG")

pillow_obj = Image.new("RGB", (WIDTH, HEIGHT))
pixel_set = pillow_obj.load()

for row in range(HEIGHT // 2):
    for col in range(WIDTH // 2):
        color = (row, abs(col - row), col)
        rev_col, rev_row = WIDTH - col - 1, HEIGHT - row - 1
        pixel_set[col, row] = color
        pixel_set[rev_col, row] = color
        pixel_set[col, rev_row] = color
        pixel_set[rev_col, rev_row] = color

pillow_obj.save(*FILENAME)



FILENAME = ("background.png", "PNG")

pillow_obj = Image.open("teste_pillow.png")
pixel_set = pillow_obj.load()
width = pillow_obj.width
height = pillow_obj.height

for row in range(height // 2):
    for col in range(width // 2):
        r, g, b = pixel_set[col, row]
        pixel_set[col, row] = (b, g, r)
        pixel_set[rev_col, rev_row] = (b, g, r)

pillow_obj.save(*FILENAME)