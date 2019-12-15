# Query 1

## Goal

For each user_id, find the diﬀerence between the last action and the second last action. Action here is defined as visiting a page. If the user has just one action, you can either remove her from the final results or keep that user_id and have NULL as time diﬀerence between the two actions.
The table below shows for each user all the pages she visited and the corresponding timestamp.

## Data

| Column Name    | Value      | Description               |
| -------------- | ---------- | ------------------------- |
| user_id        | 6684       | this is id of the user    |
| page           | home_page  | the page visited          |
| unix_timestamp | 1451640067 | unix timestamp in seconds |

# Query 2

## Goal

We have two tables. One table has all mobile actions, i.e. all pages visited by the users on mobile. The other table has all web actions, i.e. all pages visited on web by the users.
Write a query that returns the percentage of users who only visited mobile, only web and both. That is, the percentage of users who are only in the mobile table, only in the web table and in both tables. The sum of the percentages should return 1.

## Data

### data_mobile

| Column Name | Value         | Description                                               |
| ----------- | ------------- | --------------------------------------------------------- |
| user_id     | 128           | this is id of the user who visited a given page on mobile |
| page        | page_5_mobile | page visited by that user on mobile                       |

### data_web

| Column Name | Value      | Description                                            |
| ----------- | ---------- | ------------------------------------------------------ |
| user_id     | 1210       | this is id of the user who visited a given page on web |
| page        | page_1_web | page visited by that user on web                       |

# Query 3

## Goal

We define as power users those users who bought at least 10 products. Write a query that returns for each user on which day they became a power user. That is, for each user, on which day they bought the 10th item.
The table below represents transactions. That is, each row means that the corresponding user has bought something on that date.

## Data

| Column Name | Value               | Description                                             |
| ----------- | ------------------- | ------------------------------------------------------- |
| user_id     | 675                 | this is id of the user                                  |
| date        | 2014-12-31 16:16:12 | user 675 bought something on Dec 31, 2014 at 4:16:12 PM |

# Query 4

## Goal

We have two tables. One table has all \$ transactions from users during the month of March and one for the month of April.

Write a query that returns the total amount of money spent by each user. That is, the sum of the column transaction_amount for each user over both tables.

Write a query that returns day by day the cumulative sum of money spent by each user. That is, each day a user had a transcation, we should have how much money she has spent in total until that day. Obviously, the last day cumulative sum should match the numbers from the previous bullet point.

## Data

### data_march

| Column Name        | Value      | Description                                                  |
| ------------------ | ---------- | ------------------------------------------------------------ |
| user_id            | 13399      | this is id of the user who had the corresponding transaction |
| date               | 2015-03-01 | the transaction happened on March 1st.                       |
| transaction_amount | 18         | the user spent 18\$ in that transaction                      |

### data_april

| Column Name        | Value      | Description                                                  |
| ------------------ | ---------- | ------------------------------------------------------------ |
| user_id            | 15895      | this is id of the user who had the corresponding transaction |
| date               | 2015-04-01 | the transaction happened on April 1st.                       |
| transaction_amount | 66         | the user spent 66\$ in that transaction                      |

# Query 5

## Goal

We have two tables. One is user id and their signup date. The other one shows all transactions done by those users, when the transaction happens and its corresponding dollar amount.

Find the average and median transaction amount only considering those transactions that happen on the same date as that user signed-up.

## Data

### user

| Column Name  | Value      | Description                      |
| ------------ | ---------- | -------------------------------- |
| user_id      | 121        | this is id of the user           |
| sign_up_date | 2015-01-02 | user_id 121 signed up on Jan, 2. |

### transaction_table

| Column Name        | Value               | Description                                     |
| ------------------ | ------------------- | ----------------------------------------------- |
| user_id            | 856898              | this is id of the user who had that transaction |
| transaction_date   | 2015-08-02 03:56:08 | transaction happened on Aug, 2 at almost 4AM.   |
| transaction_amount | 49                  | transaction amount was 49\$.                    |

# Query 6

## Goal

We have a table with users, their country and when they created the account. We want to find:

The country with the largest and smallest number of users
A query that returns for each country the first and the last user who signed up (if that country has just one user, it should just return that single user)

## Data

| Column Name | Value               | Description                                     |
| ----------- | ------------------- | ----------------------------------------------- |
| user_id     | 2                   | this is id of the user                          |
| created_at  | 2015-02-28 16:00:40 | user 2 created her account on Feb, 2 around 4PM |
| country     | China               | She is based in China                           |
