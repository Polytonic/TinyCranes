# [TinyCranes](//www.tinycranes.com/)
[![Dependency Status](http://img.shields.io/gemnasium/Polytonic/TinyCranes.svg?style=flat-square)](https://gemnasium.com/Polytonic/TinyCranes)

## Summary
This is the full source code for my personal website. It's a bit of a mess, but if you were interested, here you go. It was originally statically generated using [CodeKit](https://incident57.com/codekit/), so I threw this together rather quickly on Node.js. A future rewrite will more than likely be done using Python or something with a sane, ordered-hashtable implementation.

## Getting Started
This application intended for deploy-on-push to Heroku, so you'll need to have an account there. Once the application is up and running, you'll need to set some environment variables.

```haskell
heroku config:set NODE_ENV=production           # Use Production Node
heroku config:set NEW_RELIC_NO_CONFIG_FILE=true # Enable New Relic
heroku config:set TZ="America/New_York"         # Set Dyno Time Zone
```

You'll also need to set a Google Analytics tracking code and configure Typekit.

## Documentation
Blog posts are written in Markdown, and should carry a YAML Front Matter header. You must supply a title key and value, from which a slug will be generated. For sorting to work, provide a full datetime string that is compatible with [Date.parse()](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/parse). The meta description will be generated from the first 200 (or fewer) characters of the post. If the post body exceeds a certain length, the post will trigger a truncated preview format. Override the preview format by setting `preview: false`. An example post is shown below:

```markdown
---
title: Second Test Post
datetime: 2015-04-14 18:55:49 -0400
preview: false
---
She explained that they had as much as thirty pounds in gold, besides a five-pound note, and suggested that with that they might get upon a train at St. Albans or New Barnet. My brother thought that was hopeless, seeing the fury of the Londoners to crowd upon the trains, and broached his own idea of striking across Essex towards Harwich and thence escaping from the country altogether. Mrs. Elphinstone--that was the name of the woman in white--would listen to no reasoning, and kept calling upon "George"; but her sister-in-law was astonishingly quiet and deliberate, and at last agreed to my brother's suggestion.
```

I use a hybrid static/dynamic architecture, mostly an artifact of my original build process. This is really dirty code, but over time, the warts in this codebase should disappear. At some point, I'll document my source code with some sort of annotated viewer. Likely [groc](//github.com/nevir/groc) or [slate](//github.com/tripit/slate).


## License
>The MIT License (MIT)

>Copyright (c) 2016 Kevin Fung

>Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

>The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

>THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
