How to Build & Run Locally :-


1. Clone this repo in your local.

$ ls -lh
-rw-r--r-- 1 amit amit 638 Mar 20 10:39 Dockerfile
-rw-r--r-- 1 amit amit  23 Mar 20 10:39 README.md
-rw-r--r-- 1 amit amit 177 Mar 20 10:39 package.json

![image](https://github.com/user-attachments/assets/59cc49ed-d1d7-4566-b5dc-37dd26addd17)

2. Build the Docker Image
   # docker build -t my-apache-site .

3. Run the Container :-
  # docker run -p 8080:80 my-apache-site

3. Open http://localhost:8080 in your browser.
You should see:-  "Hello from Apache!"
