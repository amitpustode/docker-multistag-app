How to Build & Run Locally :-

1.  Build the Docker Image
   # docker build -t my-apache-site .

2. Run the Container :-
  # docker run -p 8080:80 my-apache-site

3. Open http://localhost:8080 in your browser.
You should see:-  "Hello from Apache!"
