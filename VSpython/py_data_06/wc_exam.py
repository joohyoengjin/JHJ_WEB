from wordcloud import WordCloud
import matplotlib.pyplot as plt
import numpy as np

text = '''
    American logistics in the Normandy campaign played a key role in the success of Operation Overlord, the Allied invasion of northwest Europe during World War II. By June 1944, some 1,526,965 US troops were in the UK, of whom 459,511 were in the Services of Supply. The First United States Army was supported over the Omaha and Utah Beaches, and through the Mulberry artificial port at Omaha that was specially constructed for the purpose. The Mulberry port was abandoned after it was damaged by a storm on 19–22 June.
'''

word_cloud = WordCloud(width=800, height=400,
                       background_color='white').generate(text)

plt.figure()
plt.imshow(word_cloud)
plt.axis('off')
plt.show()