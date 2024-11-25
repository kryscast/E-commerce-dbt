## Business Problem
Olist department store needs the ability to analyze orders and identify marketing trends to increase customer satisfaction. Currently this process would be down manually by analysts who would download spreadsheets from their SQL Server to investigate. This process is time consuming and not scalable due to size of data and limitations of Excel. They need an automated solution to allow them to investigate their sales pipeline. This solution should also include automated checks to improve reporting accuracy and provide the team some ability to incorporate new changes in logic without having to pass excel files back and forth. Some changes currently happen in master Excel spreadsheets while they're being shared with leadership which loses leadership's trust in the team.

After this infrastructure is set up, a main stakeholder, a marketing manager at Olist store, wants to investigate how they can improve customer satisfaction by creating targeted marketing campaigns based on customer behavior and order history. To achieve this, I need to gather insights from at least three tables in the Brazilian E-Commerce Public Dataset by Olist Store: `customers`, `orders`, `order_items`, and 'products' (* Note for products we only have access to id and category name).

By implementing this user story, the marketing team aims to enhance customer engagement, boost sales, and ultimately improve customer satisfaction by delivering relevant offers and promotions to different customer segments. This can involve data analysis, segmentation, and campaign creation based on customer behavior and historical data.


### Context
This dataset was generously provided by Olist, the largest department store in Brazilian marketplaces. Olist connects small businesses from all over Brazil to channels without hassle and with a single contract. Those merchants are able to sell their products through the Olist Store and ship them directly to the customers using Olist logistics partners. See more on our website: www.olist.com

After a customer purchases the product from Olist Store a seller gets notified to fulfill that order. Once the customer receives the product, or the estimated delivery date is due, the customer gets a satisfaction survey by email where he can give a note for the purchase experience and write down some comments.

The dataset has information of 100k orders from 2016 to 2018 made at multiple marketplaces in Brazil. The core transactional table will be Orders, in which an Order can be comprised of multiple items which can be found in Order Items. This can then be linked to Products to categorize the orders. Orders is also tied with customers (each customer_id is tied to an Order while a unique_customer_Id denotes a unique Customer to group their Orders). This is real commercial data, it has been anonymised, and references to the companies and partners in the review text have been replaced with the names of Game of Thrones great houses.

There are further provided tables which aren't required, but can help with your analysis. The relationships can be analyzed and derived from [Kaggle](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce).


### Roadmap
Access the [roadmap](https://docs.google.com/spreadsheets/d/1IYXqHU_GGCuASDJ2ZFnN05BwJ-PvZZ3CatUDP2xb8oI/edit#gid=927480768).

Make a copy of this roadmap, and this will act as a list of itmes to complete for the capstone.






### Kaggle
https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce
