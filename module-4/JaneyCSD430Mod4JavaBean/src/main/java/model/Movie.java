/**
Jonah Aney 11/09/26 CSD-430 Module-4 JavaBean

*Directions:
For this week’s assignment you will create a JavaBean to hold some data. You will then use a JSP page to gather data from the JavaBean and display it in a nicely formatted display. For the JavaBean, use the data from your Module 2 Java Scriplet - Data Display assignment.
For this assignment you will need to:

    Document your code.
    Use Scriptlets for holding Java code.
    All HTML tags will be outside of Java Scriptlets.
    Display data in an HTML table format.
    Include other display items such as field and recode descriptions, title, and overall data description.
    Ensure the JavaBean implements java.io.Serializable.
    Data input will have a minimum of 5 fields.

 * Movie JavaBean class to hold movie data.
 * This program implements serializable to allow JSPs to use it safely.
 * Each Movie has a title, genre, release year, director, and rating.
 */

package model;

import java.io.Serializable;

public class Movie implements Serializable {
    private static final long serialVersionUID = 1L;

// Movie Fields
    private String title;
    private String genre;
    private String releaseYear;
    private String director;
    private String rating;
    ;

// No-argument constructor required for JavaBeans
    public Movie() {}

// Constructor with arguments
    public Movie(String title, String genre, String releaseYear, String director, String rating) {
        this.title = title;
        this.genre = genre;
        this.releaseYear = releaseYear;
        this.director = director;
        this.rating = rating;
    }

// Getters and Setters
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getGenre() { return genre; }
    public void setGenre(String genre) { this.genre = genre; }

    public String getReleaseYear() { return releaseYear; }
    public void setReleaseYear(String releaseYear) { this.releaseYear = releaseYear; }

    public String getDirector() { return director; }
    public void setDirector(String director) { this.director = director; }

    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }
}
