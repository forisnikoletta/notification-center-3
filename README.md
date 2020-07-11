# Welcome!


Hi! This is a simple **Notification Center** backend API, where
- Admins are able to create notifications to Clients
- Clients are able to use the REST API to get their notifications
- Admins will know if a particular notification was seen


## The usage of the API

You will be able to log in, log out, register, then add/edit/delete notifications in case you are an admin, verify your notifications if you are a client.

Provided routes:

| Plugin | README |
| ------ | ------ |
| **POST /notification(.:format)**  | create notification |
|**GET  /notification/:id(.:format)** | show one specific notification|
| **POST /admin(.:format)**  | create notification as admin|
| **GET  /admin/:id(.:format)**| check one specific notification as admin|
| **PATCH  /admin/:id(.:format)** | update notification as admin |
| **PUT  /admin/:id(.:format)** | update notification as admin |
| **DELETE /admin/:id(.:format)**  | destroy notification as admin |
| **POST /sessions(.:format)** | log in |
| **POST /registrations(.:format)**  | register |
| **DELETE /logout(.:format)** | log out, end the session |
| **GET  /logged_in(.:format)** | check if anyone is logged in |
| **GET  /admin(.:format)** | see all the notifications as a logged in admin |
| **GET  /** | see all the notifications as a logged in client |


**Some examples how You can use them:**

1) To log in:
```sh
curl --header "Content-Type: application/json" --request POST --data '{"user": {"email": "admin@mail.com", "password": "123456"}}' http://localhost:3000/sessions
```
2) To log out:
```sh
curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/logout
```


>**Note:** If you will use **Postman** to test, you will need to pass the following parameter in the header section:
**Content-Type: application/json**

## If You ❤  will implement the frontend application
- The backend API will need a nested User object from the frontend application

-   You will need to replace the domains from "some-name.something.com" to your production domain

- You will need to add `withCredentials: true` in the Log in/ Log out/ Registration handler where the form is submitted (it will tell the application that it's ok to set the cookie for the api). Without this setting the authentication will not work)

