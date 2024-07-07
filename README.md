# SQL-Surf-School

<p align="center">
  <img src="https://image.cdn2.seaart.ai/static/27d4e6081cfd96941a177d87a6270834/20230807/d60b55712e29a7064d60d9877e8a6d8a.jpeg" width="50%" alt="Surf School logo">
</p>

# Context 🌊

- SQL project with the the goal to provide insights for a surf school

How?
- Use a kaggle dataset - you can find it [here](https://www.kaggle.com/datasets/loureiro85/surfing)
  - Brazilian dataset based on online forms answered by surfers

 Goal:
 - Define the best board type according different parameters

# ERD Diagram 🎣

Dataset used has 44 columns and 164 rows. In order to become easier to analyse, the whole dataset was split into 5 tables (surfer, surfboard, performance, maneuver and wave)

<p align="center">
  <img src="https://i.ibb.co/kJBfbv9/ERD-Diagram.png" width="45%">
</p>

# Analysis 🏄
5 analysis were made in order to correlate all the tables:

 1.  To count the different surfboard type that surfers have / Understand the surfers experience
 2.  To count the different surfboard type the dataset has based on surfers experience
 3.  Understand which type of surfboard allows to do a certain maneuver
     - For this case maneuver chosen was straight_ahead and the occurrence of it was always
 4.  Understand which type of surfboard allows a better performance in a specific parameter
     - I choose flotation parameter and excellent
 5.  Understand which type of surfboard suits the best for the wave shape and wave height

# Conclusions ⛵

- Dataset doesn’t provide much information for beginner surfers
- Most of the information come from advanced surfers
- Data needs to be cleaned

### Solutions for Surf School
 1. Focus on advanced surfers - provide different surfboards (shortboards) and advanced classes supported by data and film analysis.

 2. Focus on beginner surfers - create a survey and gather information next to surf schools

 3. Mix approach - focus both on advanced and beginner surfers.

### Future actions
- Going deep on the analysis of surfboards measures
- Create a survey to define which are the best wetsuits
- Create a survey to define prices for rentals and classes



