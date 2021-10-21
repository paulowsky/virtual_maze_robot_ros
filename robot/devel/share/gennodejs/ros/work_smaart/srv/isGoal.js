// Auto-generated. Do not edit!

// (in-package work_smaart.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class isGoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pos = null;
    }
    else {
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new geometry_msgs.msg.Point32();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type isGoalRequest
    // Serialize message field [pos]
    bufferOffset = geometry_msgs.msg.Point32.serialize(obj.pos, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type isGoalRequest
    let len;
    let data = new isGoalRequest(null);
    // Deserialize message field [pos]
    data.pos = geometry_msgs.msg.Point32.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'work_smaart/isGoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c36b9dc6cd5c312342b9fb81b6e45812';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point32 pos
    
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
    const resolved = new isGoalRequest(null);
    if (msg.pos !== undefined) {
      resolved.pos = geometry_msgs.msg.Point32.Resolve(msg.pos)
    }
    else {
      resolved.pos = new geometry_msgs.msg.Point32()
    }

    return resolved;
    }
};

class isGoalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.isGoal = null;
    }
    else {
      if (initObj.hasOwnProperty('isGoal')) {
        this.isGoal = initObj.isGoal
      }
      else {
        this.isGoal = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type isGoalResponse
    // Serialize message field [isGoal]
    bufferOffset = _serializer.bool(obj.isGoal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type isGoalResponse
    let len;
    let data = new isGoalResponse(null);
    // Deserialize message field [isGoal]
    data.isGoal = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'work_smaart/isGoalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '85c7050503eb5c86b628eb1d677c0575';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool isGoal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new isGoalResponse(null);
    if (msg.isGoal !== undefined) {
      resolved.isGoal = msg.isGoal;
    }
    else {
      resolved.isGoal = false
    }

    return resolved;
    }
};

module.exports = {
  Request: isGoalRequest,
  Response: isGoalResponse,
  md5sum() { return '1b7b9b83759f54d801ad41a9a10d9074'; },
  datatype() { return 'work_smaart/isGoal'; }
};
