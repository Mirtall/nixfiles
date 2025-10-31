{
  cat = "bat";
  dtc = "docker run -v ~/dev/epita/tiger/tc:/tc/ --rm -it --user 1000 tiger:stable";
  toto = "mkdir toto && cd toto && linit $1";
  gst = "git status";
  gitlog = "git log --online --graph";
}
