import express from "express";
import multer from 'multer';
import path from 'path';
import sharp from 'sharp';
import fs from 'fs';
import { fileURLToPath } from 'url';
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

export const galleryRouter = express();
import { addPropertyImage, getImage, getImages} from "../services/gallery.js";


const storage = multer.diskStorage({
    destination: function(req, file, cb) {
      cb(null, './uploads');
    },
    filename: function(req, file, cb){
       const now = new Date().toISOString();
       const date = now.replace(/:/g, '-');
  
        var num = Math.random().toExponential().split('e-');
        var num2 = num[0].split('.');
        var key = num2[1];
        var slug = "upload" + key.slice(0, 12);
  
      cb(null, date + slug + path.extname(file.originalname));
    }
  });
  
  const upload = multer({
    storage: storage,
    limits: {
      fileSize: 1024 * 1024 * 30
    }
  })
   
galleryRouter.post('/gallery/:id',upload.single('image'), async (req, res, next) => {

    // const filename = req.file.originalname;

    fs.access('./uploads/thumbnails', (err) => {
        if (err) {
          fs.mkdirSync('./uploads/thumbnails');
        }
      });
 
      await sharp(req.file.path)
       .resize({width: 500, height: 500})
       .toFile(`./uploads/thumbnails/${req.file.filename}`);

    
    const image_thumbnail = req.file.filename
    const image_original = req.file.filename

    const property_id = req.params.id
 
    const query = await addPropertyImage(image_thumbnail, image_original, property_id)
    res.send(query)
})

galleryRouter.get('/gallery/images', async (req, res) => {
    const query = await getImages()
    res.send(query)
})

galleryRouter.get('/gallery/:id', async (req, res) => {
    const id = req.params.id
    const query = await getImage(id)
    res.send(query)
})