# Mailmeblog

Welcome to *Mailmeblog* write in your blog, just by sending emails

### How to install

Just clone the github repo..

```ruby
git clone git@github.com:aboyon/mailmeblog.git
```
### Configure your email account

Copy the config.sample.yml to config.yml (into the config/ file)

```ruby
cd config/
cp config.sample.yml config.yml
```
and then proceed to adjust the email settings

```yaml
mail:
  server: mail.gmail.com
  port: 995
  ssl: true
  username: <username>
  password: <password>

store:
  eml: "<<your_path>>"   #in case you want to keep a copy in eml format
  html: "<<your_path>>"  #HTML static file, properly formated are placed into this folder
```

so, finally, you can run the file *checkmail.rb* through your console
```
ruby checkmail.rb
```

# License

Please [see licence file](https://github.com/aboyon/mailmeblog/blob/master/LICENCE) for further reading.