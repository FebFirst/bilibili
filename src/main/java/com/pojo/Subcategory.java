package com.pojo;

import java.util.Collection;

/**
 * Created by Admin on 2016/7/12.
 */
public class Subcategory {
    private String subcategoryName;
    private String categoryName;
    private Category categoryByCategoryName;
    private Collection<VideoSubcategory> videoSubcategoriesBySubcategoryName;

    public String getSubcategoryName() {
        return subcategoryName;
    }

    public void setSubcategoryName(String subcategoryName) {
        this.subcategoryName = subcategoryName;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Subcategory that = (Subcategory) o;

        if (subcategoryName != null ? !subcategoryName.equals(that.subcategoryName) : that.subcategoryName != null)
            return false;
        if (categoryName != null ? !categoryName.equals(that.categoryName) : that.categoryName != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        int result = subcategoryName != null ? subcategoryName.hashCode() : 0;
        result = 31 * result + (categoryName != null ? categoryName.hashCode() : 0);
        return result;
    }

    public Category getCategoryByCategoryName() {
        return categoryByCategoryName;
    }

    public void setCategoryByCategoryName(Category categoryByCategoryName) {
        this.categoryByCategoryName = categoryByCategoryName;
    }

    public Collection<VideoSubcategory> getVideoSubcategoriesBySubcategoryName() {
        return videoSubcategoriesBySubcategoryName;
    }

    public void setVideoSubcategoriesBySubcategoryName(Collection<VideoSubcategory> videoSubcategoriesBySubcategoryName) {
        this.videoSubcategoriesBySubcategoryName = videoSubcategoriesBySubcategoryName;
    }
}
