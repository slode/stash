package main

import (
  "os"
  "path"
  "path/filepath"
  "fmt"
  "strings"
  "bufio"
  "github.com/codegangsta/cli"
)

func check(e error) {
  if e != nil {
    panic(e)
  }
}

func stash_new_file(s string) {
  filename := path.Join(os.Getenv("HOME"), ".stash")
  f, err := os.OpenFile(filename, os.O_APPEND | os.O_WRONLY | os.O_CREATE, 0600)
  defer f.Close()
  check(err)

  absolute_path, err := filepath.Abs(s)
  check(err)

  _, err = f.WriteString(absolute_path + "\n")
  check(err)
}

func stash_clear() {
  filename := path.Join(os.Getenv("HOME"), ".stash")
  os.Remove(filename)
}

func stash_list_files() {
  filename := path.Join(os.Getenv("HOME"), ".stash")
  file, err := os.Open(filename)
  defer file.Close()

  if err != nil {
    // Quietly return if there is no stash-file
    return
  }

  scanner := bufio.NewScanner(file)
  scanner.Split(bufio.ScanLines)
  for scanner.Scan() {
    fmt.Printf("%q\n", scanner.Text())
  }
}

func main() {
  app := cli.NewApp()
  app.Usage = "Maintains a list of file paths for later usage."
  app.Version = "0.0.1"

  app.Action = func(c *cli.Context) {
    if strings.Contains(c.App.Name, "stash-list") {
      stash_list_files()

    } else if strings.Contains(c.App.Name, "stash-clear") {
      stash_clear()
      
    } else if len(c.Args()) > 0 {
      for _, t := range c.Args() {
        stash_new_file(t)
      }
    } else {
      scanner := bufio.NewScanner(os.Stdin)
      scanner.Split(bufio.ScanLines)
      for scanner.Scan() {
        stash_new_file(scanner.Text())
      }
    }
  }

  app.Run(os.Args)
}
