# Github
 
## How to push files to Github using Git:

```sh
cd *project_directory*             # cd = change directory
git add .                          # add . mean add all files and folders in the directory, you can specify one file or folder like "git add bleble.exe" or "git add ble"
git checkout *name_of_branch*      # switch to a branch
git commit -m "messages"           # add a messages to every update you made on the project
git pull origin *name_of_branch*   # pull = fetch + merge
git push origin *name_of_branch*   # upload to github server
```

## fatal: The request was aborted: Could not create SSL/TLS secure channel. github push origin
If you're using Windows 7, here: https://support.microsoft.com/en-us/topic/update-to-enable-tls-1-1-and-tls-1-2-as-default-secure-protocols-in-winhttp-in-windows-c4bd73d2-31d7-761e-0178-11268bb10392#:~:text=Enable%20TLS%201.1%20and%201.2%20on%20Windows%207%20at%20the%20SChannel%20component%20level
