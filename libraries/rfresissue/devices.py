"""
Created on 12.2.2024

@author: 100013031
"""
from abc import ABC, abstractmethod

from robot.api.deco import keyword


class Device(ABC):  # pylint: disable=too-few-public-methods
    """Parent"""

    @abstractmethod
    def get_name(self) -> str:
        ...


class Device1(Device):
    """Device 1 functionality"""

    DEVICE_NAME = "Device1"

    @keyword
    def common_device_keyword(self) -> str:
        return self.DEVICE_NAME

    @keyword
    def custom_device1_keyword(self) -> str:
        return self.DEVICE_NAME

    def get_name(self) -> str:
        return self.DEVICE_NAME.lower()


class Device2(Device):
    """Device 2 functionality"""

    DEVICE_NAME = "Device2"

    @keyword
    def common_device_keyword(self) -> str:
        return self.DEVICE_NAME

    @keyword
    def custom_device2_keyword(self) -> str:
        return self.DEVICE_NAME

    def get_name(self) -> str:
        return self.DEVICE_NAME.lower()
