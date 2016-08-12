package com.util;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2016/7/13.
 */
public class recommendUtil {
    public static void execute(String train, String test, String output) {
        String recommendPath = System.getProperty("user.dir") + "\\src\\main\\webapp\\tools\\Recommender.exe";
        List<String> convert = new ArrayList<String>();
        convert.add(recommendPath);
        convert.add(train);
        convert.add(test);
        convert.add(output);

        ProcessBuilder builder = new ProcessBuilder();
        try {
            builder.command(convert);
            builder.redirectErrorStream(true);
            builder.start();
            // 如果此属性为 true，则任何由通过此对象的 start() 方法启动的后续子进程生成的错误输出都将与标准输出合并，
            //因此两者均可使用 Process.getInputStream() 方法读取。这使得关联错误消息和相应的输出变得更容易
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
        }
    }

    public static void main(String args[]) {
        String param_train_file = "E:\\vs2015_workspace\\copy\\train.txt";
        String param_test_file = "E:\\vs2015_workspace\\copy\\test.txt";
        String param_out_file = "E:\\vs2015_workspace\\copy\\output.txt";

        execute(param_train_file, param_test_file, param_out_file);
    }
}
