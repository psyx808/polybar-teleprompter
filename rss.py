import os
import feedparser

def titles(feed_urls):
    news = []
    for feed_url in feed_urls:
        feed = feedparser.parse(feed_url)
        for entry in feed.entries:
            title = entry.title
            news.append(title)
    return news

def save_on(news, file):
    os.makedirs(os.path.dirname(file), exist_ok=True)
    with open(file, 'w') as f:
        for new_title in news:
            f.write(new_title + '\n')

if __name__ == "__main__":
    #####################################  
    #  🛜  R S S   F E E D  U R L s  🔗 #
    #     ➕ A D D   Y O U R S  😉      #
    #####################################
    feed_urls = ['https://hackread.com/feed/','https://cybersecuritynews.es/feed/','https://feeds.feedburner.com/TheHackersNews','https://www.nist.gov/news-events/cybersecurity/rss.xml','https://www.nist.gov/news-events/Advanced%20communications/rss.xml','https://www.nist.gov/news-events/chemistry/rss.xml','https://www.nist.gov/news-events/forensic%20science/rss.xml','https://www.nist.gov/news-events/Mathematics%20and%20Statistics/rss.xml','https://www.cisa.gov/cybersecurity-advisories/all.xml','https://www.cisa.gov/news.xml','https://www.wired.com/feed/category/security/latest/rss','https://securityintelligence.com/feed']

    news = titles(feed_urls)
    file = os.path.expanduser('~/.news')
    save_on(news, file)
