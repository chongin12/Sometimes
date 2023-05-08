# Sometimes
WWDC23 Swift Student Challenge [Submitted]

**"Sometimes"** is an app that helps us realize that we are spending too much time looking at screens. Perhaps it would be nice to feel a sense of ease and freedom by looking at the wide world beyond the frustrating confines of a screen from time to time.

Full Demo Video : [Youtube](https://www.youtube.com/watch?v=qT3PcCvPN44)

## Preview

"When was the last time you looked up at the sky?" This is the hook that appears on the first screen when the app starts, designed to grab people's attention.

<img width="1016" alt="스크린샷 2023-05-07 오후 8 44 56" src="https://user-images.githubusercontent.com/19565940/236675769-28261c85-21c3-47ac-a63b-d963e49891bf.png">


On the second screen, statistics are presented to show that people spend more time looking at screens than they might think.

<img width="1016" alt="스크린샷 2023-05-07 오후 8 45 05" src="https://user-images.githubusercontent.com/19565940/236675793-500a4d81-46f2-4e38-909c-d8a57dd72663.png">


On the third screen, it is argued that looking at the screen is ultimately no different from looking at the world through a small window. On screens with only text, such as the second and third screens, animation is added to the line-by-line display to improve readability for the user.

<img width="1016" alt="스크린샷 2023-05-07 오후 8 45 12" src="https://user-images.githubusercontent.com/19565940/236675802-3963933b-bf79-48d5-9d5a-9599ad50fe72.png">


On the fourth screen, you can experience seeing the world through a small window. Inspired by the four seasons of Korea, I aimed to represent the typical natural environments that can be seen in spring, summer, fall, and winter to the world. I increased immersion by using landscapes and background music appropriate for each season.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 45 22" src="https://user-images.githubusercontent.com/19565940/236678547-95673944-f2c3-45a9-8c59-dd1ba4183476.png">

I expressed the idea of seeing the world through a small window by setting it so that only a small part of the screen is visible. While users can drag and move the window, they cannot resize it, expressing a feeling of confinement.

I used the SpriteKit's SKScene to represent the world and placed a black view that occupies the entire screen on top of it. Then placed a small black view to represent the window on top of that, using the blend mode property to make only the window part transparent. I gave the window view a Drag Gesture to allow it to be moved, and a Tap Gesture to pass the tap event to the Scene.

In Chapter 1, "Flowery Day", the feeling of spring was conveyed through the scenery of cherry blossoms falling. The cherry blossoms were represented with a fade-in effect from the top of the screen and a slow fade-out effect to efficiently manage memory once they fell to the ground. When a tap event occurred, flowers that could be seen in spring gradually appeared and disappeared. The feeling of the flowers blooming and withering was expressed through fade effects, and the feeling of vitality was conveyed through a rotate effect.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 43 36" src="https://user-images.githubusercontent.com/19565940/236678478-70047c30-9277-4524-beda-d3536ffd1385.png">


In Chapter 2, "Rainy Day", the feeling of summer was conveyed through the rainstorm and gradually rising water. The rising water was represented as a SwiftUI element on the scene. When a tap event occurred, the direction of the wind changed. The arrow that appears in the upper left corner intuitively indicates the direction of the wind.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 43 52" src="https://user-images.githubusercontent.com/19565940/236678486-0b39bfba-531e-4e56-baec-b9ab3c1577a2.png">


In Chapter 3, "Fall Foliage Day", the feeling of autumn was conveyed through the falling leaves. Various nuts falling from the trees were expressed through a tap event, and a physical effect was applied to give a sense of weight.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 44 51" src="https://user-images.githubusercontent.com/19565940/236678491-e35aa0e3-6e1e-4005-8aaf-ab4dfeb6dc1d.png">


In Chapter 4, "Snowy Day", the feeling of winter was conveyed through the snow. Users could build a snowman through a tap event, and a body in the shape of a regular octagon was applied to make it easier to build a snowman.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 47 52" src="https://user-images.githubusercontent.com/19565940/236678594-2e5877af-db1f-45ea-8bc6-eb913c5ffe62.png">


On the fifth screen, my intentions for creating this app and what I want to argue were expressed in text.
<img width="1016" alt="스크린샷 2023-05-07 오후 8 47 54" src="https://user-images.githubusercontent.com/19565940/236677673-a757788a-47b6-4c5f-b500-403193f65164.png">


On the final screen, users can experience looking at the world without windows. The feeling of being relieved from the feeling of being cramped when there are windows is a comfortable experience, and elements that were hidden can now be seen, bringing joy.
<img width="1016" alt="스크린샷 2023-05-07 오후 8 48 00" src="https://user-images.githubusercontent.com/19565940/236677679-4a7848ab-8c10-402c-81da-65a8a3ed120b.png">


Through this app, what I wanted to say was that just as it can be frustrating to only see small parts of a big screen, it can also be frustrating to only see a small screen in a big world. I hope that people can sometimes put down their devices and feel at ease while looking at the sky, and that they can see things that they might have missed before.

<img width="1016" alt="스크린샷 2023-05-07 오후 9 49 08" src="https://user-images.githubusercontent.com/19565940/236678743-a92ffa1a-0cef-42cb-a06b-3ef14c8930e8.png">
<img width="1016" alt="스크린샷 2023-05-07 오후 9 49 54" src="https://user-images.githubusercontent.com/19565940/236678750-ec5e7494-8112-4dfd-bdea-885d25a2c1ad.png">
<img width="1016" alt="스크린샷 2023-05-07 오후 9 50 20" src="https://user-images.githubusercontent.com/19565940/236678756-081035a5-a74c-488c-95d9-5c360a315447.png">
<img width="1016" alt="스크린샷 2023-05-07 오후 9 51 22" src="https://user-images.githubusercontent.com/19565940/236678762-1aa288bf-fbcf-4e06-ae32-0f4fb5493599.png">

