```
sudo pacman -S ansible ansible-core python
ansible-galaxy collection install kewlfft.aur 
ansible-playbook -i inventory.ini installer_playbook.yaml
```
