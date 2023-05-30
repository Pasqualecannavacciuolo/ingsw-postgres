#import gdown
import shutil

#url = 'https://drive.google.com/uc?id=1LyMD3u3O3y-iNJ8WXrQhlfZyMQLGa9-w'
#out_path = 'pgdata.zip'
#gdown.download(url, out_path, quiet=False)

# Unzip
shutil.unpack_archive('pgdata.zip', '.')

# Rimozione della cartella __MACOSX
shutil.rmtree('./__MACOSX')
