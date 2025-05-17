-- File: joins_queries.sql

-- Query 1: INNER JOIN
-- Retrieve all bookings and the respective users who made those bookings.
SELECT
    B.BookingID,
    B.PropertyID,
    B.BookingDate,
    U.UserID,
    U.UserName,
    U.Email AS UserEmail
FROM
    Bookings B
INNER JOIN
    Users U ON B.UserID = U.UserID;

-- Query 2: LEFT JOIN
-- Retrieve all properties and their reviews, including properties that have no reviews.
SELECT
    P.PropertyID,
    P.PropertyName,
    P.Location AS PropertyLocation,
    R.ReviewID,
    R.Rating,
    R.CommentText,
    U_Reviewer.UserName AS ReviewerUserName
FROM
    Properties P
LEFT JOIN
    Reviews R ON P.PropertyID = R.PropertyID
LEFT JOIN -- Optional: Join to get reviewer's name if UserID is in Reviews table
    Users U_Reviewer ON R.UserID = U_Reviewer.UserID;

-- Query 3: FULL OUTER JOIN
-- Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.
SELECT
    U.UserID,
    U.UserName,
    B.BookingID,
    B.PropertyID,
    B.BookingDate
FROM
    Users U
FULL OUTER JOIN
    Bookings B ON U.UserID = B.UserID;


