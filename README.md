# Ruby Containerized Application Sample

This application is an example application for the Rookout Ruby Agent [tutorial](https://docs.rookout.com/docs/ruby-container-tutorial/).

Run it in a few simple steps:
1. Build the container using Docker - `docker build . -t rookout-ruby-todo`.
2. Run the built container using `docker run -it -p 3000:3000 rookout-ruby-todo`
3. Check out your brand new web app at `http://localhost:3000`.
4. You may also test your container with TODO backend [project](https://todobackend.com/) by going to `https://www.todobackend.com/specs/index.html?http://localhost:3000/todos`.
