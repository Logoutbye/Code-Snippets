It looks like you already have multiple SSH keys in your `~/.ssh` directory, including `id_rsa_hifza` and `id_rsa_hifza.pub` which seem to be the key pair for your `hifza` GitHub account.

### Let's configure Git to use the correct SSH key:

1. **Add the SSH key for `hifza` to the SSH agent:**

   First, start the SSH agent if it’s not running yet:

   ```bash
   eval "$(ssh-agent -s)"
   ```

   Then, add your `hifza` SSH private key to the SSH agent:

   ```bash
   ssh-add ~/.ssh/id_rsa_hifza
   ```

   This will allow SSH to use the key associated with your `hifza` GitHub account for any future operations like cloning or pushing.

2. **Check that the correct key is being used:**

   You can list the currently loaded SSH keys to make sure the correct one is loaded:

   ```bash
   ssh-add -l
   ```

   If you see something like `id_rsa_hifza` in the list, it means your key is properly loaded.

3. **Configure Git to use your `hifza` GitHub account for a specific repository (if needed):**

   If you're working with a repository that requires you to make commits using the `hifza` account (and not the default `bilal` account), you can configure Git to use the correct user details for that repository:

   - First, navigate to the repository's folder:

     ```bash
     cd /path/to/your/repository
     ```

   - Then, set the `user.name` and `user.email` for this repository:

     ```bash
     git config user.name "hifza"
     git config user.email "Hifzakanwal.official@gmail.com"
     ```

4. **Test the SSH connection with GitHub:**

   To make sure that GitHub recognizes your SSH key and you're authenticating correctly with the `hifza` account, test the connection with:

   ```bash
   ssh -T git@github.com
   ```

   You should see a message like:

   ```
   Hi hifza! You've successfully authenticated, but GitHub does not provide shell access.
   ```

5. **Clone the repository again using the SSH URL:**

   Now you should be able to clone repositories via SSH using the correct GitHub account.

   Try cloning the repository again with the correct SSH URL (replace with your actual repository URL):

   ```bash
   git clone git@github.com:joaquinreyes/padelarena.git
   ```

   This should work without the `Permission denied` error if everything is set up correctly.

---

### To Summarize:

- You've successfully added the `hifza` SSH key to the SSH agent.
- You've ensured that your Git configuration is using the correct account for commits.
- You've tested SSH access to GitHub with your `hifza` account.
- Now you should be able to clone and push to repositories as `hifza`.

Let me know if you encounter any issues!
