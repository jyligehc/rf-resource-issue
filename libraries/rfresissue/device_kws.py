"""
Created on 12.2.2024

@author: 100013031
"""
from typing import Any

from rfresissue.devices import Device, Device1, Device2
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn
from robotlibcore import HybridCore


class DeviceKws(HybridCore):
    """Provides keyword to Robot"""

    ROBOT_LIBRARY_SCOPE = "GLOBAL"

    def __init__(self) -> None:
        """Constructor"""
        self._device1 = Device1()
        self._device2 = Device2()
        self._current_device: Device = self._get_device_by_name(self._get_device_name(self._device1))

        HybridCore.__init__(self, [self._current_device])
        self._set_device_name()

    @keyword
    def connect_to(self, device_name: str) -> None:
        """Connects to a device by name"""
        match device_name:
            case "Device1":
                self._current_device = self._device1
            case "Device2":
                self._current_device = self._device2
            case _:
                self._current_device = self._device1
        self._reload_keywords()
        self._set_device_name()
        assert True

    def _reload_keywords(self) -> None:
        """Reload CsMonitor keywords"""
        self.keywords: dict[str, Any] = {}
        self.keywords_spec: dict[str, Any] = {}
        self.attributes: dict[str, Any] = {}
        self.add_library_components([self._current_device])
        self.add_library_components([self])
        myname = self._get_my_name()
        BuiltIn().reload_library(myname)

    def _get_my_name(self) -> str:
        """Returns my full qualified name"""
        mytype = type(self)
        qualname = f"{mytype.__module__}.{mytype.__qualname__}"
        return qualname

    def _get_device_by_name(self, device_name: str) -> Device:
        match device_name:
            case "device1":
                return self._device1
            case "device2":
                return self._device2
            case _:
                return self._current_device

    def _set_device_name(self) -> None:
        BuiltIn().set_global_variable("${DEVICE_NAME}", self._current_device.get_name())

    def _get_device_name(self, default: Device) -> str:
        return str(BuiltIn().get_variable_value("${DEVICE_NAME}", default.get_name()))
