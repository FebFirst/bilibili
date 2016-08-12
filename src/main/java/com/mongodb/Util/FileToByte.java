package com.mongodb.Util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

/**
 * Created by Admin on 2016/6/11.
 */
public class FileToByte {
    public static byte[] getBytesFromFile(File file) {
        if (file == null) {
            return null;
        }
        try {
            FileInputStream stream = new FileInputStream(file);
            ByteArrayOutputStream out = new ByteArrayOutputStream(1024);
            byte[] b = new byte[1024];
            int n;
            while ((n = stream.read(b)) != -1)
                out.write(b, 0, n);

            stream.close();
            out.close();
            return out.toByteArray();
        } catch (IOException e) {
            e.getStackTrace();
        }
        return null;
    }
}
