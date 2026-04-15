# E-commerce Checkout Funnel Analysis

##  Project Overview
This project analyzes the end-to-end e-commerce checkout funnel to identify user drop-off points and improve overall conversion rate and revenue performance.

The goal is to understand why users do not complete purchases despite high traffic and provide data-driven recommendations to optimize the funnel.

---

## 🎯 Objective
- Identify key  drop-off stages in the funnel  
- Measure conversion rate from product view to purchase  
- Analyze user behavior across devices and regions  
- Evaluate revenue impact and potential loss  

---

## 🛠️ Tools & Technologies
- SQL → Data extraction & transformation  
- Excel → Data cleaning & validation  
- Power BI → Dashboard & visualization  
- DAX → KPI calculations (conversion %, drop-off %, AOV)  

---

## 📊 Dataset
The dataset contains user-level event data:

-  event_name → view_item, add_to_cart, begin_checkout, purchase  
-  user_pseudo_id → unique user  
-  device → desktop, mobile, tablet  
-  country → user location  
-  transaction_id → purchase ID  
-  purchase_revenue → revenue  

---

##  Approach
- Mapped user events into funnel stages  
- Built a structured funnel:  
  View → Cart → Checkout → Purchase  
- Calculated:
  - Conversion Rate
  - Drop-off %
  - Cart Abandonment
  - Average Order Value (AOV)  
- Performed segmentation analysis (device & country)  
- Designed interactive Power BI dashboards  

---

##  Key Insights
- ~87% users drop before adding to cart  
- ~62% cart abandonment rate  
- Overall conversion rate ~2.83%  
- Mobile users have lower conversion than desktop  
- Significant revenue loss due to funnel inefficiencies  

---

##  Recommendations
- Improve product page UX and CTA visibility  
- Simplify checkout process (reduce steps, guest checkout)  
- Optimize mobile experience  
- Retarget users with cart abandonment strategies  

---

##  Dashboard Highlights
- Executive KPI overview  
- Funnel analysis with drop-off stages  
- User behavior segmentation (device, country)  
- Revenue analysis (AOV, revenue loss)  
