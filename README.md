# Force Pull Requests

Just a basic webserver that responds to webhooks with success. This allows you to protect a branch and prevent users from pushing into master without a Pull Request.

## Configuration

Just add a webhook to `http://force-pr.herokuapp.com/payload` for `push` events.

![](https://cloud.githubusercontent.com/assets/35968/13303690/9bf6ab4a-db05-11e5-9ead-62ad662f24f7.png)

You'll then see Pull Requests return successful

![](https://cloud.githubusercontent.com/assets/35968/13303959/0735018a-db07-11e5-978e-693fe7b311db.png)
