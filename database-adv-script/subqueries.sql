-- File: subqueries.sql

-- Query 1: Non-correlated Subquery
-- Find all properties where the average rating is greater than 4.0.
SELECT
    P.PropertyID,
    P.PropertyName,
    P.Location
FROM
    Properties P
WHERE
    P.PropertyID IN (
        SELECT
            R.PropertyID
        FROM
            Reviews R
        GROUP BY
            R.PropertyID
        HAVING
            AVG(R.Rating) > 4.0
    );

-- Query 2: Correlated Subquery
-- Find users who have made more than 3 bookings.
SELECT
    U.UserID,
    U.UserName,
    U.Email
FROM
    Users U
WHERE
    (
        SELECT
            COUNT(B.BookingID)
        FROM
            Bookings B
        WHERE
            B.UserID = U.UserID -- Correlation with the outer query's Users table
    ) > 3;

