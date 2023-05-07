# Sometimes
WWDC23 Swift Student Challenge [Submitted]

"When was the last time you looked up at the sky?" This is the hook that appears on the first screen when the app starts, designed to grab people's attention.

On the second screen, statistics are presented to show that people spend more time looking at screens than they might think.

On the third screen, it is argued that looking at the screen is ultimately no different from looking at the world through a small window. On screens with only text, such as the second and third screens, animation is added to the line-by-line display to improve readability for the user.

On the fourth screen, you can experience seeing the world through a small window. Inspired by the four seasons of Korea, I aimed to represent the typical natural environments that can be seen in spring, summer, fall, and winter to the world. I increased immersion by using landscapes and background music appropriate for each season.

I expressed the idea of seeing the world through a small window by setting it so that only a small part of the screen is visible. While users can drag and move the window, they cannot resize it, expressing a feeling of confinement.

I used the SpriteKit's SKScene to represent the world and placed a black view that occupies the entire screen on top of it. Then placed a small black view to represent the window on top of that, using the blend mode property to make only the window part transparent. I gave the window view a Drag Gesture to allow it to be moved, and a Tap Gesture to pass the tap event to the Scene.

In Chapter 1, "Flowery Day", the feeling of spring was conveyed through the scenery of cherry blossoms falling. The cherry blossoms were represented with a fade-in effect from the top of the screen and a slow fade-out effect to efficiently manage memory once they fell to the ground. When a tap event occurred, flowers that could be seen in spring gradually appeared and disappeared. The feeling of the flowers blooming and withering was expressed through fade effects, and the feeling of vitality was conveyed through a rotate effect.

In Chapter 2, "Rainy Day", the feeling of summer was conveyed through the rainstorm and gradually rising water. The rising water was represented as a SwiftUI element on the scene. When a tap event occurred, the direction of the wind changed. The arrow that appears in the upper left corner intuitively indicates the direction of the wind.

In Chapter 3, "Fall Foliage Day", the feeling of autumn was conveyed through the falling leaves. Various nuts falling from the trees were expressed through a tap event, and a physical effect was applied to give a sense of weight.

In Chapter 4, "Snowy Day", the feeling of winter was conveyed through the snow. Users could build a snowman through a tap event, and a body in the shape of a regular octagon was applied to make it easier to build a snowman.

On the fifth screen, my intentions for creating this app and what I want to argue were expressed in text.

On the final screen, users can experience looking at the world without windows. The feeling of being relieved from the feeling of being cramped when there are windows is a comfortable experience, and elements that were hidden can now be seen, bringing joy.

Through this app, what I wanted to say was that just as it can be frustrating to only see small parts of a big screen, it can also be frustrating to only see a small screen in a big world. I hope that people can sometimes put down their devices and feel at ease while looking at the sky, and that they can see things that they might have missed before.
