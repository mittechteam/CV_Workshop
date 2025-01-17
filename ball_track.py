import cv2
import numpy as np

vid = cv2.VideoCapture("CV_Workshop-main\\res\\ball_for_tracking.mov")

cposL = []
while True:
    ret, img = vid.read()
    if not ret:
        break
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    Upper_hsv = np.array([4, 255, 255])
    lower_hsv = np.array([0, 170, 90])
    mask = cv2.inRange(hsv, lower_hsv, Upper_hsv)
    res = cv2.bitwise_and(img, img, mask=mask)

    x, y, w, h = cv2.boundingRect(mask)
    cv2.rectangle(img, (x - 20, y - 20), (x + w + 20, y + h + 20), (0, 255, 0), 1)

    centre = ((x + w), (y + h))
    cposL.append(centre)
    for pos in cposL:
        cv2.circle(img, pos, 2, (255, 255, 255), -1)

    cv2.imshow("org", img)
    # cv2.imshow("mask", mask)
    # cv2.imshow("res",res)

    if cv2.waitKey(1) & 0xFF == ord("x"):
        break
cv2.destroyAllWindows()