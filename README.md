# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
   2.5.1

* System dependencies

* Configuration

* Database creation

  rails db:create
  rails db:migrate
  rails db:seed

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Requirements:
  Leave Management System where user will be able to apply for leave, get approval and
see leave balance.
- Below are the requirements of the app.
- Develop a login page with username, password, remember me(Use Devise gem).
- Once user logs in, redirect to user profile page to display, leave application status and leave
balance (Leaves credited, Leaves taken, Current leave balance) to be displayed in a table.
- User Profile Page requirements:
- Each leave application page & leave application status page should have these fields
User name, leave apply date, leave date(From- To),Reason for leave, reporting head name,
Leave status (Applied, Approved, Rejected).
- User should have option to cancel/modify/ edit request only before it is approved/rejected
i.e. only in Applied status. Clicking on cancel request should ask user for confirmation and
delete.
- At the top of the page, on the right hand side there should be option for New Leave
application.
- Clicking on New Leave Application should open a popup with fields, Clicking on Edit
leave application should open a popup with fields pre-filled. (All fields should be allowed to
edit).
- Email notification should be sent to User’s reporting head and user itself for each leave
request, cancel or edit request.
- Only reporting head can approve or reject the leave request.
- Leave balance should be reduced when leave request is approved.
Technical Requirements:
- Ruby on Rails 4 or 5
- MySQL, Bootstrap
- Jquery, Javascript
