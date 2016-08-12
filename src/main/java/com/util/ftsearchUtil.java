package com.util;

/**
 * Created by frank_xiang on 2016/7/12.
 */

import com.pojo.Video;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.Field.TermVector;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKSimilarity;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * ftsearchUtil.java
 * @version 1.0
 * @createTime Lucene数据库检索
 */
public class ftsearchUtil {
    private static Connection conn = null;
    private static Statement stmt = null;
    private static  ResultSet rs = null;
    private String searchDir = "D:\\workspace\\Test\\Index";
    private static File indexFile = null;
    private static Searcher searcher = null;
    private static Analyzer analyzer = null;
    /** 索引页面缓冲 */
    private int maxBufferedDocs = 500;
    /**
     * 获取数据库数据
     * @return ResultSet
     * @throws Exception
     */
    public List<Video>getResult(String queryStr) throws Exception {
        List<Video> result = null;
        TopDocs topDocs = this.search(queryStr);
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        result = this.addHits2List(scoreDocs);
        return result;
    }

    /**
     * 为数据库检索数据创建索引
     * @throws Exception
     */
    public void createIndex() throws Exception {
        conn = Jdbc_Util.getConnection();
        if(conn == null) {
            throw new Exception("数据库连接失败！");
        }
        String sql = "select video_id, title, content from video";

        stmt = conn.createStatement();
        rs = stmt.executeQuery(sql);

        Directory directory = null;
        IndexWriter indexWriter = null;

        try {
            indexFile = new File(searchDir);
            if(!indexFile.exists()) {
                indexFile.mkdir();
            }
            directory = FSDirectory.open(indexFile);
            analyzer = new IKAnalyzer();

            indexWriter = new IndexWriter(directory, analyzer, true, IndexWriter.MaxFieldLength.UNLIMITED);
            indexWriter.setMaxBufferedDocs(maxBufferedDocs);
            Document doc = null;
            while(rs.next()) {
                doc = new Document();
                Field videoId = new Field("videoId", String.valueOf(rs.getInt("video_id")), Field.Store.YES, Field.Index.NOT_ANALYZED, TermVector.NO);
                Field title = new Field("title", rs.getString("title") == null ? "" : rs.getString("title"), Field.Store.YES, Field.Index.ANALYZED, TermVector.NO);
                Field content = new Field("content", rs.getString("content") == null ? "" : rs.getString("content"), Field.Store.YES, Field.Index.ANALYZED, TermVector.NO);
                doc.add(videoId);
                doc.add(title);
                doc.add(content);
                indexWriter.addDocument(doc);
            }

            indexWriter.optimize();
            indexWriter.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 搜索索引
     * @param queryStr
     * @return
     * @throws Exception
     */
    private TopDocs search(String queryStr) throws Exception {
        if(searcher == null) {
            indexFile = new File(searchDir);
            searcher = new IndexSearcher(FSDirectory.open(indexFile));
        }
        searcher.setSimilarity(new IKSimilarity());
        QueryParser parser = new QueryParser(Version.LUCENE_30,"title",new IKAnalyzer());
        Query query = parser.parse(queryStr);

        TopDocs topDocs = searcher.search(query, searcher.maxDoc());
        return topDocs;
    }

    /**
     * 返回结果并添加到List中
     * @param scoreDocs
     * @return
     * @throws Exception
     */
    private List<Video> addHits2List(ScoreDoc[] scoreDocs ) throws Exception {
        List<Video> listBean = new ArrayList<Video>();
        Video videoBean = null;
        for(int i=0 ; i<scoreDocs.length; i++) {
            int docId = scoreDocs[i].doc;
            Document doc = searcher.doc(docId);
            videoBean = new Video();
            videoBean.setVideoId(Integer.valueOf(doc.get("videoId")));
            videoBean.setContent(doc.get("content"));
            videoBean.setTitle(doc.get("title"));
            listBean.add(videoBean);
        }
        return listBean;
    }
}