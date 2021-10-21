// Auto-generated. Do not edit!

// (in-package work_smaart.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Point32 {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.posicao = null;
    }
    else {
      if (initObj.hasOwnProperty('posicao')) {
        this.posicao = initObj.posicao
      }
      else {
        this.posicao = new geometry_msgs.msg.Point32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Point32
    // Serialize message field [posicao]
    bufferOffset = geometry_msgs.msg.Point32.serialize(obj.posicao, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Point32
    let len;
    let data = new Point32(null);
    // Deserialize message field [posicao]
    data.posicao = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'work_smaart/Point32';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8346df72a1510091ffcefeb2f51167a7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point32 posicao
    ================================================================================
    MSG: geometry_msgs/Point32
    # This contains the position of a point in free space(with 32 bits of precision).
    # It is recommeded to use Point wherever possible instead of Point32.  
    # 
    # This recommendation is to promote interoperability.  
    #
    # This message is designed to take up less space when sending
    # lots of points at once, as in the case of a PointCloud.  
    
    float32 x
    float32 y
    float32 z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Point32(null);
    if (msg.posicao !== undefined) {
      resolved.posicao = geometry_msgs.msg.Point32.Resolve(msg.posicao)
    }
    else {
      resolved.posicao = new geometry_msgs.msg.Point32()
    }

    return resolved;
    }
};

module.exports = Point32;
