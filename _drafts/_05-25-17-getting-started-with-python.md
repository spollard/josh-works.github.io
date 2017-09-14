---
layout: post
title:  "Up and running with Python"
date:   2017-05-25 06:18:52 -0600
categories: programming learning
permalink: up-and-running-with-python
---

I'm going into the deep end with mapping.

Maps and data visualization are super fun to me.

I gave my first run at D3 not too long ago, and now it's on to doing some other cool stuff.

### Misc Notes

**Default "new jupyter notebook" was using Python 2. I wanted Python 3.**

Use the instructions [here](https://conda.io/docs/using/envs.html#create-an-environment) to create a new environment, if needed, and then activate it.

Now when you fire up Jupyter, it's in the correct environment.

```python
import osmnx as ox
%matplotlib inline
G = ox.graph_from_place('Piedmont, California, USA', network_type='drive')
fig, ax = ox.plot_graph(ox.project_graph(G))
```

and we get something!

![python street map!](/images/17-05-25-python_jpg.jpg)

Wonder what Golden, CO looks like?

![Golden street map](/images/17-05-25-python_1.jpg)

Worth noting is it can take a while to render maps. Golden took just a few seconds, but something larger like Denver has taken 3-6 minutes, or maybe more. I walked away from my machine while it was thinking.

No wonder it takes so long, look at all this data!

![Denver_osmnx](/images/17-05-26-osmnx_1.jpg)



### Resources

- [Geoff Boeing _getting started with Python_](http://geoffboeing.com/2017/02/python-getting-started/)
- [Geoff Boeing's OSMnx mapping package](http://geoffboeing.com/2016/11/osmnx-python-street-networks/)
